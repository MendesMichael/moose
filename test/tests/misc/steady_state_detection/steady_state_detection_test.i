[Mesh]
  type = GeneratedMesh
  dim = 1
  nx = 1
[]

[Variables]
  [u]
    family = LAGRANGE
    order = FIRST
  []
[]

[ICs]
  [u_ic]
    type = ConstantIC
    variable = u
    value = 1.0
  []
[]

[Kernels]
  [td]
    type = TimeDerivative
    variable = u
  []
  [diff]
    type = Diffusion
    variable = u
  []
[]

[BCs]
  [left]
    type = DirichletBC
    variable = u
    boundary = left
    value = 1.0
  []
  [right]
    type = DirichletBC
    variable = u
    boundary = right
    value = 1.0
  []
[]

[AuxVariables]
  [dummy]
    family = LAGRANGE
    order = FIRST
  []
[]

[AuxKernels]
  [dummy_aux]
    type = ParsedAux
    variable = dummy
    expression = 0.0
  []
[]

[Executioner]
  type = Transient
  dt = 1.0
  num_steps = 3
  steady_state_detection = true
  check_aux = true
[]

[Outputs]
  console = true
  exodus = false
[]
