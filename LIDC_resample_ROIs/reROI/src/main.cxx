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


int main( int argc, char * argv[] )
{

  int SPACING = 50; // mm box 

  typedef itk::Image< int , 3 > ImageType;

  typedef itk::ImageFileReader< ImageType > ReaderType;

  ReaderType::Pointer reader = ReaderType::New();
  reader->SetFileName(argv[1]);
  reader->Update();

  ImageType::SizeType inSize = reader->GetOutput()->GetLargestPossibleRegion().GetSize();

  typedef itk::RegionOfInterestImageFilter< ImageType, ImageType > FilterType;
  FilterType::Pointer filter = FilterType::New();
  // --- end beginning declarations ---


  ImageType::SpacingType sp = reader->GetOutput()->GetSpacing();
  ImageType::SizeType full_size = reader->GetOutput()->GetRequestedRegion().GetSize(); // but we haven't put in a request?!
  ImageType::PointType origin = reader->GetOutput()->GetOrigin(); // hopefully meaningless
  //ImageType::DirectionType direct = reader->GetOutput()->GetDirection(); // should always be the same

  // begin math:: refer to global coordinates as 0,0,0 to size2

  // perform z conversion

  std::vector<int> centers(3,0.0);
  centers[0] = (int)(atof(argv[3]) + 0.5f); // should be rounded integers???
  centers[1] = (int)(atof(argv[4]) + 0.5f) ;
  centers[2] =  (int) ( (1/sp[2]) * (atof(argv[5]) - origin[2]) + 0.5f); // Z's formula

  std::vector<int> ROI_range(3,0); // range of SPACING in voxels, rounded to int
  ROI_range[0] = (int) (SPACING/sp[0] + 0.5f);
  ROI_range[1] = (int) (SPACING/sp[1] + 0.5f);
  ROI_range[2] = (int) (SPACING/sp[2] + 0.5f);



  ImageType::IndexType start; // some weird type
  start[0] = centers[0] - ROI_range[0] / 2;
  start[1] = centers[1] - ROI_range[1] / 2;
  start[2] = centers[2] - ROI_range[2] / 2;

  ImageType::SizeType size;
  size[0] = ROI_range[0]; 
  size[1] = ROI_range[1];
  size[2] = ROI_range[2];

  // end math  

  // check out of bounds stuff
  int diff;
  for (int i=0; i < 3; i++) { // tested for 4 cases and it works!
    if (start[i] < 0) {
      diff = 0 - start[i];  
      std::cout << "oob (bottom) " << argv[1] << "; chopping off " << diff << " bottom in axis "  << i << std::endl;
      start[i] = 0;
    }
    if ((start[i] + size[i]) > full_size[i] ) {
      diff = ((start[i] + size[i]) - full_size[i] );
      std::cout << "oob (top) "  << argv[1] << "; chopping off " << diff << " top in axis "  << i << std::endl;
      size[i] = full_size[i] - start[i];
    }
  } 


  // --- begin ending declarations ---
  ImageType::RegionType desiredRegion;
  desiredRegion.SetIndex(start);
  desiredRegion.SetSize(size);

  filter ->SetRegionOfInterest(desiredRegion);
  filter->SetInput(reader->GetOutput());

  // -- end copied stuff from itk example ---

  typedef itk::ImageFileWriter < ImageType > WriterType;
  WriterType::Pointer writer = WriterType::New();
  writer->SetFileName(argv[2]);
  writer->SetInput(filter->GetOutput());

  writer->Update();
  return EXIT_SUCCESS;

}