class EditableRecoveryStepsSection < SitePrism::Section
  element :title, 'h3'
  element :recovery_steps, "textarea#recovery-steps"
end

class RecoveryStepsSection < SitePrism::Section
  element :title, 'h3'
  element :recovery_steps, '.value'
end