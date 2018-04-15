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

//THIS PROGRAM RESAMPLES THE ROI BASED ON THE CENTERPOINTS AND A 50 MM WINDOW

// takes a patient scan and an x y z for the centerpoint (may end )

// MISC TODO:
//   print some error message if the direction is wrong
//   have some output method for cases where it goes out of bounds: print some filename error


int main( int argc, char * argv[] )
{
  if( argc <  5 )
    {
      std::cerr <<  argv[0] << " Usage: "  << std::endl;
      std::cerr << "[1] inputImageFile, [2] outname, [3] x centerpoint, [4] y centerpoint, [5] z centerpoint" << std::endl;
      return EXIT_FAILURE;
    }

  int SPACING = 50; // in mm, size of box

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

  // update reader so we can read image info
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

  // MATH

  float x_cp = atof(argv[3]);
  float y_cp = atof(argv[4]);
  float z_cp = atof(argv[5]);

  // vectors of min/max so we don't cut outside the box
  std::vector<float> mins(3,0.0); // VOXEL UNITS (may have dec)
  mins[0] = origin[0]; 
  mins[1] = origin[1];
  mins[2] = origin[2];
  
  std::vector<float> maxes(3,0.0); // VOXEL UNITS (may have dec)
  maxes[0] = origin[0] + size[0];
  maxes[1] = origin[1] + size[1];
  maxes[2] = origin[2] + size[2];

  std::vector<int> ROI_range(3,0); // VOXEL UNITS (int because displacement)
  ROI_range[0] = (int) (SPACING / (2*sp[0]) + 0.5f);
  ROI_range[1] = (int) (SPACING / (2*sp[1]) + 0.5f);
  ROI_range[2] = (int) (SPACING / (2*sp[2]) + 0.5f);

  std::vector<float> ROI_bottom(3,0.0); // VOXEL UNITS (may have dec)
  ROI_bottom[0] = x_cp - ROI_range[0];
  ROI_bottom[1] = y_cp - ROI_range[1];
  ROI_bottom[2] = z_cp - ROI_range[2];

  std::vector<float> ROI_top(3,0.0); // VOXEL UNITS (may have dec)
  ROI_top[0] = x_cp + ROI_range[0];
  ROI_top[1] = y_cp + ROI_range[1];
  if (ROI_top[1] - maxes[1] > 0.005 ) { ROI_top[1] = maxes[1]; }
  ROI_top[2] = z_cp + ROI_range[2];
  

  // REGION
  //  start: voxel indices
  ImageType::IndexType start;
  start[0] = 155.2;//ROI_bottom[0];
  start[1] = ROI_bottom[1];
  start[2] = -147; //ROI_bottom[2];

  // size: voxel indices
  ImageType::IndexType end;
  end[0] = 219.2;//ROI_top[0];
  end[1] = 348;//ROI_top[1];
  end[2] = -107; //ROI_top[2];

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

 
  //Pipeline (2)
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
