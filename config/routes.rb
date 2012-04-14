JasmineStories::Engine.routes.draw do
  root :to => "spec#index"
end

Rails.application.routes.draw do
  mount JasmineStories::Engine => "/jasmine-stories"
end
