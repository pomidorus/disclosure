module PersonHelper
  def surname person_name
    person_name.split(' ')[0]
  end

  def imya_otchestvo person_name
    "#{person_name.split(' ')[1]} #{person_name.split(' ')[2]}"
  end
end
