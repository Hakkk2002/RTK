namespace itk
{

CudaFDKConeBeamReconstructionFilter
::CudaFDKConeBeamReconstructionFilter()
{
  // Create each filter which are specific for cuda
  m_RampFilter = RampFilterType::New();
  m_BackProjectionFilter = BackProjectionFilterType::New();

  //Permanent internal connections
  m_RampFilter->SetInput( m_WeightFilter->GetOutput() );
  m_BackProjectionFilter->SetInput( 1, m_RampFilter->GetOutput() );

  // Default parameters
  m_BackProjectionFilter->InPlaceOn();
  m_BackProjectionFilter->SetTranspose(false);
}

void
CudaFDKConeBeamReconstructionFilter
::GenerateData()
{
  BackProjectionFilterType* cudabp = dynamic_cast<BackProjectionFilterType*>( m_BackProjectionFilter.GetPointer() );

  // Init GPU memory
  cudabp->InitDevice();

  // Run reconstruction
  this->Superclass::GenerateData();

  // Transfer result to CPU image
  cudabp->CleanUpDevice();
}

} // end namespace itk
