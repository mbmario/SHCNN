#include "itkImage.h"
#include "itkImageFileReader.h"
#include "itkResampleImageFilter.h"
#include "itkIdentityTransform.h"
#include "itkBSplineInterpolateImageFunction.h"
#include "itkImageFileWriter.h"

#include <iostream>
#include "math.h"
#include "string.h"

//The program resamples image to target spacing
int main( int argc, char * argv[] )
{
  if( argc < 3 )
    {
      std::cerr << "Usage: " << std::endl;
      std::cerr << argv[0] << " inputImageFile outputImageFile" << std::endl;
      return EXIT_FAILURE;
    }

  //ITK settings
  const unsigned int Dimension = 3;
  typedef int PixelType;
  typedef itk::Image< PixelType, Dimension > ImageType;
  typedef itk::ImageFileReader< ImageType > ReaderType;
  typedef itk::ResampleImageFilter< ImageType, ImageType >  ResampleFilterType;
  typedef itk::IdentityTransform< double, Dimension >  TransformType;
  typedef itk::BSplineInterpolateImageFunction< ImageType, double >  InterpolatorType;
  typedef itk::ImageFileWriter< ImageType > WriterType;
  
  //Filters
  ReaderType::Pointer reader = ReaderType::New();
  ResampleFilterType::Pointer resampleFilter = ResampleFilterType::New();
  TransformType::Pointer transform = TransformType::New();
  InterpolatorType::Pointer interpolator = InterpolatorType::New();
  WriterType::Pointer writer = WriterType::New();

  //Parameters
  reader->SetFileName( argv[1] );
  writer->SetFileName( argv[2] );
  resampleFilter->SetTransform( transform );
  resampleFilter->SetInterpolator( interpolator );
  //Pipeline
  try
    {
      reader->Update();
    }
  catch ( itk::ExceptionObject &err)
    {
      std::cout<<"Problems reading input image"<<std::endl;
      std::cerr << "ExceptionObject caught !" << std::endl;
      std::cerr << err << std::endl;
      return EXIT_FAILURE;
    }
  
  //Get image specs
  ImageType::SpacingType spacing = reader->GetOutput()->GetSpacing(); 
  ImageType::PointType origin = reader->GetOutput()->GetOrigin(); 
  ImageType::DirectionType direction = reader->GetOutput()->GetDirection();
  ImageType::SizeType  size = reader->GetOutput()->GetRequestedRegion().GetSize();
  std::cout<<spacing<<std::endl; //" "<<size<<" "<<origin<<std::endl<<direction<<std::endl;
  float targetSizeX = size[0];
  float targetSizeY = size[1] * spacing[1] / spacing[0];
  float targetSizeZ = size[2] * spacing[2] / spacing[0];
  size[0] = targetSizeX;
  size[1] = targetSizeY;
  size[2] = targetSizeZ;
  float targetSpacingX = spacing[0];
  float targetSpacingY = spacing[0];
  float targetSpacingZ = spacing[0];
  spacing[0] = targetSpacingX;
  spacing[1] = targetSpacingY;
  spacing[2] = targetSpacingZ;
  resampleFilter->SetOutputOrigin( origin );
  resampleFilter->SetOutputSpacing( spacing );
  resampleFilter->SetOutputDirection( direction );
  resampleFilter->SetSize( size );
  resampleFilter->SetInput( reader->GetOutput() );

  //Write output  
  writer->SetInput( resampleFilter->GetOutput() );
  try
    {
      writer->Update();
    }
  catch( itk::ExceptionObject & err )
    {
      std::cout<<"ExceptionObject caught !"<<std::endl;
      std::cout<< err <<std::endl;
      return EXIT_FAILURE;
    }
 
  return EXIT_SUCCESS;
}
