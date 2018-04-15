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

  // please only supply filename

  typedef itk::Image< int , 3 > ImageType;

  typedef itk::ImageFileReader< ImageType > ReaderType;

  ReaderType::Pointer reader = ReaderType::New();
  reader->SetFileName(argv[1]);
  reader->Update();

  ImageType::SizeType inSize = reader->GetOutput()->GetLargestPossibleRegion().GetSize();
  // --- end beginning declarations ---


  ImageType::SpacingType sp = reader->GetOutput()->GetSpacing();
  /*ImageType::SizeType size2 = reader->GetOutput()->GetRequestedRegion().GetSize(); // but we haven't put in a request?!
  ImageType::PointType origin = reader->GetOutput()->GetOrigin(); // hopefully meaningless
  ImageType::DirectionType direct = reader->GetOutput()->GetDirection(); // should always be the same
*/
  std::cout << "file " << argv[1] ;
  std::cout << "spacing, " << sp[0] << ", " << sp[1] <<  ", " << sp[2] << std::endl;
  //std::cout << "origin " << origin[0] << ", " << origin[1] <<  ", " << origin[2] << std::endl;
  //std::cout << "size " <<  size2[0] << ", " << size2[1] <<  ", " << size2[2] << std::endl;
  

  return EXIT_SUCCESS;

}