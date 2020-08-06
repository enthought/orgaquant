cwlVersion: v1.0
class: CommandLineTool

hints:
  DockerRequirement:
    dockerPull: quay.io/enthought/orgaquant:1.0.0

baseCommand: python

arguments: ["/OrgaQuant/orgaquant-1-cwl.py"]

inputs:
  #python_script:
  #  type: File
  #  inputBinding: {position: 1, prefix: python}
  #  default: {class: File, location: ../Common/Python/extract_reads_cwl.py}

  image_path:
    type: File
    inputBinding:
      position: 5
      prefix: "-i"

  model_path:
    type: File
    inputBinding:
      position: 6
      prefix: "-m"

outputs:

  csv:
    type: File
    outputBinding:
      glob: $(inputs.image_path.basename).csv

  png:
    type: File
    outputBinding:
      glob: $(inputs.image_path.basename)_detected.png
