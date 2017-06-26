class EmotionsController < ApplicationController


  def index
    @emotion = Emotion.all
    respond_to? do |format|
      format.html
      format.json {render json: @emotion}
      format.pdf do
        pdf = Prawn::Document.new
        send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
      end
    end
  end

end
