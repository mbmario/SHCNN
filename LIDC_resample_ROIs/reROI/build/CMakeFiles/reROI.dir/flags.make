# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

# compile CXX with /usr/bin/c++
CXX_FLAGS =   -Wno-array-bounds -msse2 -g -I/home/mario/Documents/LIDC_resample_ROIs/reROI/build/ITKIOFactoryRegistration -I/usr/local/itk/Modules/Video/Filtering/include -I/usr/local/itk/Modules/Video/IO/include -I/usr/local/itk/Modules/Video/Core/include -I/usr/local/itk/Modules/Nonunit/Review/include -I/usr/local/itk/Modules/Registration/RegistrationMethodsv4/include -I/usr/local/itk/Modules/Registration/Metricsv4/include -I/usr/local/itk/Modules/Numerics/Optimizersv4/include -I/usr/local/itk/Modules/Segmentation/LevelSetsv4/include -I/usr/local/itk/Modules/Segmentation/Watersheds/include -I/usr/local/itk/Modules/Segmentation/Voronoi/include -I/usr/local/itk/Modules/Bridge/VTK/include -I/usr/local/itk/Modules/Filtering/SpatialFunction/include -I/usr/local/itk/Modules/Segmentation/RegionGrowing/include -I/usr/local/itk/Modules/Filtering/QuadEdgeMeshFiltering/include -I/usr/local/itk/Modules/Numerics/NeuralNetworks/include -I/usr/local/itk/Modules/Segmentation/MarkovRandomFieldsClassifiers/include -I/usr/local/itk/Modules/Segmentation/LabelVoting/include -I/usr/local/itk/Modules/Segmentation/KLMRegionGrowing/include -I/usr/local/itk/Modules/Filtering/ImageNoise/include -I/usr/local/itk/Modules/Filtering/ImageFusion/include -I/usr/local/itk/Modules/IO/TransformMatlab/include -I/usr/local/itk/Modules/IO/TransformInsightLegacy/include -I/usr/local/itk/Modules/IO/TransformHDF5/include -I/usr/local/itk/Modules/IO/TransformBase/include -I/usr/local/itk/Modules/IO/RAW/include -I/usr/local/itk/Modules/IO/MRC/include -I/usr/local/itk/Modules/IO/HDF5/include -I/usr/local/itk/Modules/IO/Siemens/include -I/usr/local/itk/Modules/IO/GE/include -I/usr/local/itk/Modules/IO/IPL/include -I/usr/local/itk/Modules/IO/CSV/include -I/usr/local/ITK-4.7.2-build/Modules/ThirdParty/HDF5/src -I/usr/local/itk/Modules/ThirdParty/HDF5/src -I/usr/local/itk/Modules/Filtering/GPUThresholding/include -I/usr/local/itk/Modules/Filtering/GPUSmoothing/include -I/usr/local/itk/Modules/Registration/GPUPDEDeformable/include -I/usr/local/itk/Modules/Registration/GPUCommon/include -I/usr/local/itk/Modules/Filtering/GPUImageFilterBase/include -I/usr/local/itk/Modules/Filtering/GPUAnisotropicSmoothing/include -I/usr/local/itk/Modules/Core/GPUFiniteDifference/include -I/usr/local/itk/Modules/Core/GPUCommon/include -I/usr/local/itk/Modules/IO/Mesh/include -I/usr/local/itk/Modules/ThirdParty/GIFTI/src/gifticlib -I/usr/local/itk/Modules/Registration/FEM/include -I/usr/local/itk/Modules/Registration/PDEDeformable/include -I/usr/local/itk/Modules/Numerics/FEM/include -I/usr/local/itk/Modules/Registration/Common/include -I/usr/local/itk/Modules/IO/SpatialObjects/include -I/usr/local/itk/Modules/IO/XML/include -I/usr/local/itk/Modules/Numerics/Eigen/include -I/usr/local/itk/Modules/Filtering/DisplacementField/include -I/usr/local/itk/Modules/Filtering/DiffusionTensorImage/include -I/usr/local/itk/Modules/Filtering/Denoising/include -I/usr/local/itk/Modules/Segmentation/DeformableMesh/include -I/usr/local/itk/Modules/Filtering/Deconvolution/include -I/usr/local/itk/Modules/ThirdParty/DICOMParser/src/DICOMParser -I/usr/local/ITK-4.7.2-build/Modules/ThirdParty/DICOMParser/src/DICOMParser -I/usr/local/itk/Modules/Filtering/Convolution/include -I/usr/local/itk/Modules/Filtering/FFT/include -I/usr/local/itk/Modules/Filtering/Colormap/include -I/usr/local/itk/Modules/Segmentation/Classifiers/include -I/usr/local/itk/Modules/Segmentation/BioCell/include -I/usr/local/itk/Modules/Filtering/BiasCorrection/include -I/usr/local/itk/Modules/Numerics/Polynomials/include -I/usr/local/itk/Modules/Filtering/AntiAlias/include -I/usr/local/itk/Modules/Segmentation/LevelSets/include -I/usr/local/itk/Modules/Segmentation/SignedDistanceFunction/include -I/usr/local/itk/Modules/Numerics/Optimizers/include -I/usr/local/itk/Modules/Filtering/ImageFeature/include -I/usr/local/itk/Modules/Filtering/ImageSources/include -I/usr/local/itk/Modules/Filtering/ImageGradient/include -I/usr/local/itk/Modules/Filtering/Smoothing/include -I/usr/local/itk/Modules/Filtering/ImageCompare/include -I/usr/local/itk/Modules/Filtering/FastMarching/include -I/usr/local/itk/Modules/Core/QuadEdgeMesh/include -I/usr/local/itk/Modules/Filtering/DistanceMap/include -I/usr/local/itk/Modules/Numerics/NarrowBand/include -I/usr/local/itk/Modules/Filtering/BinaryMathematicalMorphology/include -I/usr/local/itk/Modules/Filtering/LabelMap/include -I/usr/local/itk/Modules/Filtering/MathematicalMorphology/include -I/usr/local/itk/Modules/Segmentation/ConnectedComponents/include -I/usr/local/itk/Modules/Filtering/Thresholding/include -I/usr/local/itk/Modules/Filtering/ImageLabel/include -I/usr/local/itk/Modules/Filtering/ImageIntensity/include -I/usr/local/itk/Modules/Filtering/Path/include -I/usr/local/itk/Modules/Filtering/ImageStatistics/include -I/usr/local/itk/Modules/Core/SpatialObjects/include -I/usr/local/itk/Modules/Core/Mesh/include -I/usr/local/itk/Modules/Filtering/ImageCompose/include -I/usr/local/itk/Modules/Core/TestKernel/include -I/usr/local/itk/Modules/IO/VTK/include -I/usr/local/itk/Modules/IO/Stimulate/include -I/usr/local/itk/Modules/IO/PNG/include -I/usr/local/itk/Modules/ThirdParty/PNG/src -I/usr/local/ITK-4.7.2-build/Modules/ThirdParty/PNG/src -I/usr/local/itk/Modules/IO/NRRD/include -I/usr/local/itk/Modules/ThirdParty/NrrdIO/src/NrrdIO -I/usr/local/ITK-4.7.2-build/Modules/ThirdParty/NrrdIO/src/NrrdIO -I/usr/local/itk/Modules/IO/NIFTI/include -I/usr/local/itk/Modules/ThirdParty/NIFTI/src/nifti/znzlib -I/usr/local/itk/Modules/ThirdParty/NIFTI/src/nifti/niftilib -I/usr/local/itk/Modules/IO/Meta/include -I/usr/local/itk/Modules/ThirdParty/MetaIO/src/MetaIO -I/usr/local/ITK-4.7.2-build/Modules/ThirdParty/MetaIO/src/MetaIO -I/usr/local/itk/Modules/IO/LSM/include -I/usr/local/itk/Modules/IO/TIFF/include -I/usr/local/itk/Modules/ThirdParty/TIFF/src -I/usr/local/ITK-4.7.2-build/Modules/ThirdParty/TIFF/src/itktiff -I/usr/local/ITK-4.7.2-build/Modules/ThirdParty/TIFF/src -I/usr/local/itk/Modules/IO/JPEG/include -I/usr/local/itk/Modules/ThirdParty/JPEG/src -I/usr/local/ITK-4.7.2-build/Modules/ThirdParty/JPEG/src -I/usr/local/itk/Modules/IO/GIPL/include -I/usr/local/itk/Modules/IO/GDCM/include -I/usr/local/itk/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition -I/usr/local/itk/Modules/ThirdParty/GDCM/src/gdcm/Source/MessageExchangeDefinition -I/usr/local/itk/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition -I/usr/local/itk/Modules/ThirdParty/GDCM/src/gdcm/Source/Common -I/usr/local/itk/Modules/ThirdParty/GDCM/src/gdcm/Source/DataDictionary -I/usr/local/itk/Modules/ThirdParty/GDCM/src/gdcm/Source/MediaStorageAndFileFormat -I/usr/local/ITK-4.7.2-build/Modules/ThirdParty/GDCM/src/gdcm/Source/Common -I/usr/local/ITK-4.7.2-build/Modules/ThirdParty/GDCM -I/usr/local/itk/Modules/ThirdParty/ZLIB/src -I/usr/local/ITK-4.7.2-build/Modules/ThirdParty/ZLIB/src -I/usr/local/itk/Modules/ThirdParty/OpenJPEG/src/openjpeg -I/usr/local/ITK-4.7.2-build/Modules/ThirdParty/OpenJPEG/src/openjpeg -I/usr/local/itk/Modules/ThirdParty/Expat/src/expat -I/usr/local/ITK-4.7.2-build/Modules/ThirdParty/Expat/src/expat -I/usr/local/itk/Modules/IO/BioRad/include -I/usr/local/itk/Modules/IO/BMP/include -I/usr/local/itk/Modules/IO/ImageBase/include -I/usr/local/ITK-4.7.2-build/Modules/IO/ImageBase -I/usr/local/itk/Modules/Filtering/AnisotropicSmoothing/include -I/usr/local/itk/Modules/Filtering/ImageGrid/include -I/usr/local/itk/Modules/Core/ImageFunction/include -I/usr/local/itk/Modules/Core/Transform/include -I/usr/local/itk/Modules/Numerics/Statistics/include -I/usr/local/ITK-4.7.2-build/Modules/ThirdParty/Netlib -I/usr/local/itk/Modules/Core/ImageAdaptors/include -I/usr/local/itk/Modules/Filtering/CurvatureFlow/include -I/usr/local/itk/Modules/Filtering/ImageFilterBase/include -I/usr/local/itk/Modules/Core/FiniteDifference/include -I/usr/local/itk/Modules/Core/Common/include -I/usr/local/ITK-4.7.2-build/Modules/Core/Common -I/usr/local/itk/Modules/ThirdParty/VNLInstantiation/include -I/usr/local/ITK-4.7.2-build/Modules/ThirdParty/VNL/src/vxl/core -I/usr/local/ITK-4.7.2-build/Modules/ThirdParty/VNL/src/vxl/vcl -I/usr/local/ITK-4.7.2-build/Modules/ThirdParty/VNL/src/vxl/v3p/netlib -I/usr/local/itk/Modules/ThirdParty/VNL/src/vxl/core -I/usr/local/itk/Modules/ThirdParty/VNL/src/vxl/vcl -I/usr/local/itk/Modules/ThirdParty/VNL/src/vxl/v3p/netlib -I/usr/local/ITK-4.7.2-build/Modules/ThirdParty/KWSys/src -I/usr/local/itk/Modules/ThirdParty/DoubleConversion/src/double-conversion   

CXX_DEFINES = -DITK_IO_FACTORY_REGISTER_MANAGER

