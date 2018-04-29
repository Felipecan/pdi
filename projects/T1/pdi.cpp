#include "pdi.hpp"
#include <opencv2/opencv.hpp>

#include <cstdio>

using namespace cv;

PDI::PDI(){}

PDI::~PDI(){}

Mat PDI::getImg()
{
    return this->img;
}

void PDI::read_img(const char* filename_img)
{
    img = imread(filename_img, IMREAD_COLOR);
    img_copy = img.clone();
    // img_copy = imread(filename_img, IMREAD_COLOR);
}

void PDI::BGR2YIQ()
{   
    
    //printf("cols: %i, rows: %i, channels: %i, dims: %i ", img.cols, img.rows, img.channels(), img.dims);
    //int pause;
    //std::cin >> pause;
    
    
    unsigned int co = img.cols;
    unsigned int ro = img.rows;
    unsigned int ch = img.channels();
    float b,g,r;
    img.convertTo(img, CV_8SC3);
    //float* temp = new float[c*r*ch]; // VER O QUE FAZER

    for(unsigned int i = 0; i < co*ro*ch; i=i+3)
    {   
        // (b, g, r) -> (q, i, y) na realidade.
        b = (0.312*img_copy.data[i] - 0.523*img_copy.data[i+1] + 0.211*img_copy.data[i+2]);
        g = (-0.322*img_copy.data[i] - 0.274*img_copy.data[i+1] + 0.596*img_copy.data[i+2]); 
        r = (0.114*img_copy.data[i] + 0.587*img_copy.data[i+1] + 0.299*img_copy.data[i+2]);
        // temp[i] =    (0.312*img_copy.data[i] - 0.523*img_copy.data[i+1] + 0.211*img_copy.data[i+2]);
        // temp[i+1] = (-0.322*img_copy.data[i] - 0.274*img_copy.data[i+1] + 0.596*img_copy.data[i+2]); 
        // temp[i+2] =  (0.114*img_copy.data[i] + 0.587*img_copy.data[i+1] + 0.299*img_copy.data[i+2]);
        //printf("data0 %f, dataf %f, data2 %f\n", img.data[i], img.data[i+1], img.data[i+2]);
        //printf("data0 %f, dataf %f, data2 %f\n", temp[i], temp[i+1], temp[i+2]);
        //std::cin >> pause;
        //printf("bruto data0 %i, data1 %i, data2 %i\n", (0.312*img_copy.data[i] - 0.523*img_copy.data[i+1] + 0.211*img_copy.data[i+2]), 
        //                                                (-0.322*img_copy.data[i] - 0.274*img_copy.data[i+1] + 0.596*img_copy.data[i+2]),
        //                                                 (0.114*img_copy.data[i] + 0.587*img_copy.data[i+1] + 0.299*img_copy.data[i+2]));



        if(b > 128)
            img.data[i] = 128;
        else if(b < -127)
            img.data[i] = -127;
        else
            img.data[i] = b;

        if(g > 128)
            img.data[i+1] = 128;
        else if(g < -127)
            img.data[i+1] = -127;
        else
            img.data[i+1] = g;

        if(r > 128)
            img.data[i+2] = 128;
        else if(r < -127)
            img.data[i+2] = -127;
        else
            img.data[i+2] = r;
    }

    //img = Mat(r, c, CV_16SC3, temp);
}

Mat PDI::BGR2YIQ(Mat m)
{
    Mat temp = m.clone();
    temp.convertTo(temp, CV_8SC3);

    for(unsigned int i = 0; i < m.total()*m.channels(); i=i+3)
    {
        // (b, g, r)
        temp.data[i] = 0.114*m.data[i] + 0.587*m.data[i+1] + 0.299*m.data[i+2];
        temp.data[i+1] = -0.322*m.data[i] - 0.274*m.data[i+1] + 0.596*m.data[i+2]; 
        temp.data[i+2] = 0.312*m.data[i] - 0.523*m.data[i+1] + 0.211*m.data[i+2];
    }

    return temp;
}

void PDI::YIQ2BGR()
{
    Mat temp = img.clone();
    int b, g, r;
    
    img.convertTo(img, CV_8UC3);

    for(unsigned int i = 0; i < img.total()*img.channels(); i=i+3)
    {
        // (b, g, r)
        b = (1.703*temp.data[i] - 1.106*temp.data[i+1] + temp.data[i+2]); 
        g = (-0.647*temp.data[i] - 0.272*temp.data[i+1] + temp.data[i+2]); 
        r = (0.621*temp.data[i] + 0.956*temp.data[i+1] + temp.data[i+2]);

        if(b > 255)
            img.data[i] = 255;
        else if(b < 0)
            img.data[i] = 0;
        else
            img.data[i] = b;

        if(g > 255)
            img.data[i+1] = 255;
        else if(g < 0)
            img.data[i+1] = 0;
        else
            img.data[i+1] = g;

        if(r > 255)
            img.data[i+2] = 255;
        else if(r < 0)
            img.data[i+2] = 0;
        else
            img.data[i+2] = r;
    }
}

Mat PDI::BGR_byBand(int color_band)
{   
 
    Mat temp = Mat::zeros(img.rows, img.cols, CV_8UC3);

    if(color_band == BLUE)
    {
        for(unsigned int i = 0; i < img.total()*img.channels(); i=i+3)
        {   
            temp.data[i] = img.data[i];
        }
    }
    else if(color_band == GREEN)
    {
        for(unsigned int i = 0; i < img.total()*img.channels(); i=i+3)
        {   
            temp.data[i+1] = img.data[i+1];
        }
    }
    else if(color_band == RED)
    {
        for(unsigned int i = 0; i < img.total()*img.channels(); i=i+3)
        {   
            temp.data[i+2] = img.data[i+2];
        }
    }
    else
    {
        std::cerr << "Opcao de cor invalida" << std::endl;
        temp.release();
    }

    return temp;
}

Mat PDI::BGR_byBand(Mat m, int color_band)
{   
   
    Mat temp = Mat::zeros(m.rows, m.cols, m.type());

    if(color_band == BLUE)
    {
        for(unsigned int i = 0; i < m.total()*m.channels(); i=i+3)
        {   
            temp.data[i] = m.data[i];
        }
    }
    else if(color_band == GREEN)
    {
        for(unsigned int i = 0; i < m.total()*m.channels(); i=i+3)
        {   
            temp.data[i+1] = m.data[i+1];
        }
    }
    else if(color_band == RED)
    {
        for(unsigned int i = 0; i < m.total()*m.channels(); i=i+3)
        {   
            temp.data[i+2] = m.data[i+2];
        }
    }
    else
    {
        std::cerr << "Opcao de cor invalida" << std::endl;
        temp.release();
    }

    return temp;
}

void PDI::negative(int neg_BGR_Y)
{
    if(neg_BGR_Y == NEG_BGR)
    {
        for(unsigned int i = 0; i < img.total()*img.channels(); i++)
        {
            img.data[i] = 255 - img_copy.data[i];
        } 
    }
    else if(neg_BGR_Y == NEG_Y)
    {

    }
    else
    {
        std::cerr << "Opcao de conversao invalida" << std::endl;
    }
}

Mat PDI::negative(Mat m, int neg_BGR_Y)
{
    if(neg_BGR_Y == NEG_BGR)
    {
        for(unsigned int i = 0; i < m.total()*m.channels(); i++)
        {
            m.data[i] = 255 - m.data[i];
        }

        return m; 
    }
    else if(neg_BGR_Y == NEG_Y)
    {
        return m;
    }
    else
    {
        std::cerr << "Opcao de conversao invalida" << std::endl;
        m.release();
        return m;
    }
}



