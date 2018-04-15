#include "itkImage.h"
#include "itkImageFileReader.h"
#include "itkImageFileWriter.h"
#include "itkRegionOfInterestImageFilter.h"
//#include "itkImageRegionIterator.h"

#include <iostream>
#include <string>
#include "math.h"
#include "string.h"
#include "malloc.h" 

#include "centers_csv.h"

//The program RESAMPLES THE ROI BASED ON THE CENTERPOINTS CSV AND A 50 MM WINDOW

int main( int argc, char * argv[] )
{
  if( argc < 3 )
    {
      std::cerr <<  argv[0] << " Usage: "  << std::endl;
      std::cerr << argv[1] << " inputImageFile " << std::endl;
      std::cerr << argv[2] << " inputCentersCSV " << std::endl;

      return EXIT_FAILURE;
    }

  //IMAGE DEFS
  const unsigned int Dimension = 3;
  typedef int PixelType;
  typedef itk::Image< PixelType, Dimension > ImageType;
  
  // READER DEF & SETTINGS
  typedef itk::ImageFileReader< ImageType > ReaderType;
  ReaderType::Pointer reader = ReaderType::New();
  reader->SetFileName( argv[1] );

  // ROI FILTER DEF 
  typedef itk::RegionOfInterestImageFilter < ImageType, ImageType > FilterType;

  // WRITER DEF 
  typedef itk::ImageFileWriter < ImageType > WriterType;


  // READ CSV


  // update reader so we can read
  try {
      reader->Update();
  } catch ( itk::ExceptionObject &err) {
      std::cout<<"Intial Reader Error"<<std::endl;   
      std::cerr << "ExceptionObject caught !" << std::endl;
      std::cerr << err << std::endl;
      return EXIT_FAILURE;
  }

  // DO MATH ON CSV DATA TO GET VOXEL INDICES
  ImageType::SpacingType sp = reader->GetOutput()->GetSpacing();
  ImageType::SizeType  size = reader->GetOutput()->GetRequestedRegion().GetSize();
  ImageType::PointType origin = reader->GetOutput()->GetOrigin();
  ImageType::DirectionType direct = reader->GetOutput()->GetDirection();

  std::cout << "SPACING " << sp[0] << ", " << sp[1] << ", " << sp[2] << std::endl;
  std::cout << "SIZE " << size[0] << ", " << size[1] << ", " << size[2] << std::endl;
  std::cout << "ORIGIN " << origin[0] << ", " << origin[1] << ", " << origin[2] << std::endl;
  std::cout << "DIRECTION " << direct << std::endl;


  // size[0], size[1], size[2]; spacing[0], spacing[1], spacing[2]  


  // testing indices
  
  // REGION
  //  start: voxel indices
  ImageType::IndexType start;
  start[0] = origin[0];
  start[1] = origin[1];
  start[2] = origin[2];

  // size: voxel indices
  ImageType::IndexType end;
  end[0] = -200.8;
  end[1] = -152;
  end[2] = -315;

  // set region itself
  ImageType::RegionType region;
  region.SetIndex(start);
  region.SetUpperIndex(end);

  // FILTER SETTINGS
  FilterType::Pointer filter = FilterType::New();
  filter->SetInput( reader-> GetOutput() );
  filter->SetRegionOfInterest( region );


  // WRITER SETTINGS
  WriterType::Pointer writer = WriterType::New();
  writer->SetFileName( argv[2] );
  writer->SetInput( filter->GetOutput() );

 
  //Pipeline
  try
    {
      writer->Update(); // writer is the last in the pipeline
    }
  catch ( itk::ExceptionObject &err)
    {
      std::cout<<"Pipeline Error (full pipeline)"<<std::endl;
      std::cerr << "ExceptionObject caught !" << std::endl;
      std::cerr << err << std::endl;
      return EXIT_FAILURE;
    }
  
  

  return EXIT_SUCCESS;
}
