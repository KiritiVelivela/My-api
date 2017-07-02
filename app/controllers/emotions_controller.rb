class EmotionsController < ApplicationController

#URL
  #http://localhost:3000/uploads/emotion.pdf

  def index
   # @emo = Emotion.select("attachment")
   # puts @emo.each
   #@emo.each do |pdf|
    # pdf.attachment.concat("http://10.0.2.2:3000")
   #end
    #puts @emo
   # response['error'] = false;

    #response['message'] = "PDfs fetched successfully.";

#    response['pdfs'] = array();
    #puts @emo
    #@emo.attachment.append("http://10.0.2.2:3000")
    json_response(Emotion.all)
  end



  def pd
    @emotion = Emotion.all
   # h = 0
    #s =0
   # n = 0
    h = Emotion.where(:emotion =>  "happy").count
    puts h
      #h = h + 1
    s = @emotion.where(:emotion => "sad").count
    puts s
   # s = s+ 1
    n = @emotion.where(:emotion => "neutral").count
   puts n
   #n = n + 1
   # end
   @pdf = Prawn::Document.new do
      text "number of happy customers ="+"#{h}"
      text "number of sad customers ="+"#{s}"
      text "number of neutral customers ="+"#{n}"
      render_file File.join(Rails.root, "public/uploads", "emotions.pdf")

   end

    u = Emotion.find('1')
    File.open('public/uploads/emotion.pdf') do |f|
      u.attachment = f
    end

    u.save!

   # respond_to? do |format|
     # format.html
      #format.json {render json: @emotion}
    #  format.pdf do
     #   pdf = Prawn::Document.new
       # send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
   #   end
    #end
  end



end
