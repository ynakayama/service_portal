# -*- encoding: utf-8 -*-

class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @question = Question.find_by_id(params[:question])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @answer }
    end
  end

  def create
    @answer = Answer.new(params[:answer])
    respond_to do |format|
      if @answer.save
        format.html { redirect_to root_path,
          notice: 'アンケートへのご協力ありがとうございました！' }
        format.json { render json: @answer, status: :created, location: @answer }
      else
        format.html { render action: "new" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end
end
