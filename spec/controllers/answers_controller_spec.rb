require 'spec_helper'

describe AnswersController do

  it "#new" do
    get :new
    expect(assigns(:answers)).to eq Post.last
  end

end

