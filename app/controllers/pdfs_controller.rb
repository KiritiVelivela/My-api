class PdfsController < ApplicationController


#URL
#http://localhost:3000/uploads/emotion.pdf

  def index
    json_response(Pdf.all)
  end


  def pdaily
    @emotion = Emotion.all.where('created_at >= ?', Time.zone.now.beginning_of_day)

    h = Emotion.where(:emotion =>  "happy").count

    s = @emotion.where(:emotion => "sad").count

    n = @emotion.where(:emotion => "neutral").count


    @pdf = Prawn::Document.new do
      text "number of happy customers ="+"#{h}"
      text "number of sad customers ="+"#{s}"
      text "number of neutral customers ="+"#{n}"
      render_file File.join(Rails.root, "public/uploads/allpdfs/Daily", "emotions_Daily_#{Time.now.strftime('%y-%m-%d_%H-%M-%S')}.pdf")

    end

    u = Pdf.new
    File.open("public/uploads/allpdfs/Daily/emotions_Daily_#{Time.now.strftime('%y-%m-%d_%H-%M-%S')}.pdf") do |f|
      u.attachment = f
      u.name = "emotions_Daily_#{Time.now.strftime('%y-%m-%d_%H-%M-%S')}.pdf"
    end

    u.save!

    json_response(Pdf.all.order('created_at DESC'))

  end

  def pmonthly
    @emotion = Emotion.all.where('created_at BETWEEN ? AND ? ', 1.month.ago.beginning_of_month , 1.month.ago.end_of_month)

    h = Emotion.where(:emotion =>  "happy").count

    s = @emotion.where(:emotion => "sad").count

    n = @emotion.where(:emotion => "neutral").count


    @pdf = Prawn::Document.new do
      text "number of happy customers ="+"#{h}"
      text "number of sad customers ="+"#{s}"
      text "number of neutral customers ="+"#{n}"
      render_file File.join(Rails.root, "public/uploads/allpdfs/Montly", "emotions_Montly_#{Time.now.strftime('%y-%m-%d_%H-%M-%S')}.pdf")

    end

    u = Pdf.new
    File.open("public/uploads/allpdfs/Monthly/emotions_Montly_#{Time.now.strftime('%y-%m-%d_%H-%M-%S')}.pdf") do |f|
      u.attachment = f
      u.name = "emotions_Montly_#{Time.now.strftime('%y-%m-%d_%H-%M-%S')}.pdf"
    end

    u.save!

    json_response(Pdf.all.order('created_at DESC'))

  end

  def pweekly
    @emotion = Emotion.all.where('created_at BETWEEN ? AND ? ', 1.week.ago.beginning_of_week , 1.week.ago.end_of_week)

    h = Emotion.where(:emotion =>  "happy").count

    s = @emotion.where(:emotion => "sad").count

    n = @emotion.where(:emotion => "neutral").count


    @pdf = Prawn::Document.new do
      text "number of happy customers ="+"#{h}"
      text "number of sad customers ="+"#{s}"
      text "number of neutral customers ="+"#{n}"
      render_file File.join(Rails.root, "public/uploads/allpdfs/weekly", "emotions_Weekly_#{Time.now.strftime('%y-%m-%d_%H-%M-%S')}.pdf")

    end

    u = Pdf.new
    File.open("public/uploads/allpdfs/Weekly/emotions_Weekly_#{Time.now.strftime('%y-%m-%d_%H-%M-%S')}.pdf") do |f|
      u.attachment = f
      u.name = "emotions_Weekly_#{Time.now.strftime('%y-%m-%d_%H-%M-%S')}.pdf"
    end

    u.save!


    json_response(Pdf.all.order('created_at DESC'))

  end



end
