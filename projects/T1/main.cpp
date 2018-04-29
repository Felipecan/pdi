#include <iostream>
#include <string>
#include <cstdio>
#include <opencv2/opencv.hpp>

#include "pdi.hpp"

using namespace std;
using namespace cv;

int main(int argc, char** argv)
{
    PDI obj;
    string file_name;

    // para testes
    Mat m_teste;
    vector<Mat> ch(3);

    cout << "Digite o caminho para a imagem: ";
    cin >> file_name;

    obj.read_img(file_name.c_str());

    if( (obj.getImg()).empty() )
    {
        cout << "A imagem nao pode ser carregda" << endl;
        return -1;
    }
    
    //m_teste = obj.getImg();
    //printf("data0 %i, data1 %i, data2 %i\n", m_teste.step[0], m_teste.step[1], m_teste.step[2]);
    //obj.BGR2YIQ();
    // printf("data0 %i, data1 %i, data2 %i\n", m_teste.data[0], m_teste.data[1], m_teste.data[2]);
    //obj.YIQ2BGR();

    //split(obj.getImg(), ch);
    // printf("m_teste0 %i, m_teste1 %i, m_teste2 %i\n", m_teste.at<Vec3b>(0, 0)[0], m_teste.at<Vec3b>(0, 0)[1], m_teste.at<Vec3b>(0, 0)[2]);
    // cout << "cols " << m_teste.cols << " rows " << m_teste.rows << " dims " << m_teste.dims << endl;
    // cout << "tam " << m_teste.total() << endl;
    // cout << "real tam " << m_teste.cols*m_teste.rows*m_teste.channels() << endl;

    obj.BGR2YIQ();
    // obj.YIQ2BGR();
   
    namedWindow("img", WINDOW_NORMAL);
    imshow("img", obj.getImg());

    //namedWindow("img_color", WINDOW_NORMAL);
    //imshow("img_color", obj.BGR_byBand(BLUE));

    //obj.negative();

    //namedWindow("img_neg", WINDOW_NORMAL);
    //imshow("img_neg", obj.getImg());

    // namedWindow("img_ch", WINDOW_NORMAL);
    // imshow("img_ch", ch[0]);
    waitKey(0);

    return 0;
}