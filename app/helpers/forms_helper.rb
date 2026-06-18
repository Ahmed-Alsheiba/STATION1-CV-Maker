module FormsHelper
  # Renders a date range like "Jan 2021 – Mar 2022" or "June 2015 – Present".
  # Dates are free-text strings; a blank end becomes "Present".
  def cv_date_range(start_date, end_date)
    return "" if start_date.blank? && end_date.blank?
    finish = end_date.presence || "Present"
    [start_date.presence, finish].compact.join(" – ")
  end

  # Splits a multi-line description into bullet lines.
  def cv_bullets(text)
    text.to_s.split(/\r?\n/).map(&:strip).reject(&:blank?)
  end

  # Renders `count` proficiency dots, filling the first `level` of them.
  def skill_dots(level, filled:, empty:, count: 5)
    safe_join((0...count).map do |i|
      content_tag(:span, "", class: "inline-block w-2.5 h-2.5 rounded-full #{i < level.to_i ? filled : empty}")
    end)
  end

  # Maps a 1..max proficiency level to a 0..100 percentage (for bar widths).
  def level_percent(level, max: 5)
    pct = [[level.to_i, 0].max, max].min * (100.0 / max)
    pct.round
  end
end
