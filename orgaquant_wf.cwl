#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

requirements:
  ScatterFeatureRequirement: {}

inputs:
  imagein: File[]
  modelin: File

outputs:
  csv_result:
    type: File[]
    outputSource: orgaquant_step/csv
  image_result:
    type: File[]
    outputSource: orgaquant_step/png

steps:

  orgaquant_step:
    run: tools/orgaquant.cwl
    scatter: [image_path]
    scatterMethod: dotproduct
    in:
      image_path: imagein
      model_path: modelin
    out:
      [csv, png] 
