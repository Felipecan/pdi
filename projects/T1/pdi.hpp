#ifndef _PDI_
#define _PDI_

#include <typeinfo> 
#include <opencv2/opencv.hpp>

#define BLUE  1
#define GREEN 2 
#define RED   3

#define NEG_BGR 0
#define NEG_Y   1 

class PDI
{

    private:
        cv::Mat img;
        cv::Mat img_copy;
        

    public:
        PDI();
        ~PDI();
        cv::Mat getImg();
        // cv::Mat getImgCopy();
        // cv::Mat getImgGray();
        void read_img(const char* filename_img);
        void BGR2YIQ();
        cv::Mat BGR2YIQ(cv::Mat m);
        void YIQ2BGR();
        cv::Mat BGR_byBand(int color_band);
        cv::Mat BGR_byBand(cv::Mat m, int color_band);
        void negative(int neg_BGR_Y);
        cv::Mat negative(cv::Mat m, int neg_BGR_Y);


        template<class TYPE>
        void brightness(TYPE value);


};

template<class TYPE>
void PDI::brightness(TYPE value)
{
    int r, g, b;

    if(typeid(value).name() == typeid(int).name())
    {
        for(int i = 0; i < img.total()*img.channels(); i=i+3)
        {
            b = img.data[i] + value;
            g = img.data[i+1] + value;
            r = img.data[i+2] + value;

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
    else if (typeid(value).name() == typeid(float).name() || 
             typeid(value).name() == typeid(double).name())
    {   
        if(value < 0)
        {
            std::cerr << "Nao e possivel operar com numeros negativos" << std::endl;
        }
        else
        {
            for(int i = 0; i < img.total()*img.channels(); i=i+3)
            {
                b = img.data[i] * value;
                g = img.data[i+1] * value;
                r = img.data[i+2] * value;

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
    }
    else
    {
        std::cerr << "Talvez o tipo nao foi definido corretamente" << std::endl;
    }
}

#endif