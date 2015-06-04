ActiveAdmin.register Hackathon do
  permit_params :theme, :description, :state, :starting_at, :ending_at
  scope :all, default: true
end
