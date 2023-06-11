class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      get_personality_recommendation
      redirect_to @user, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :age, :gender)
  end

  def get_personality_recommendation
    require 'openai'

    OpenAI.api_key = ENV["OPENAI_API_KEY"]

    response = OpenAI::Completion.create(
      engine: "text-davinci-002",
      prompt: "Based on the profile information: #{current_user.profile.interests}, the ideal personality traits in a partner would be...",
      max_tokens: 100
    )

    current_user.profile.recommendation.update(text: response.choices.first.text.strip)
  end
end
