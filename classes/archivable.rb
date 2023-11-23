class Archivable
  def initialize(item, cover_state, last_played_at = nil, on_spotify = nil)
    @item = item
    @cover_state = cover_state
    @last_played_at = last_played_at
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return @item.can_be_archived? || @cover_state == 'bad' if @last_played_at.nil? && @on_spotify.nil?

    return (Time.now - @last_played_at) >= 2 * 365 * 24 * 60 * 60 if @on_spotify.nil?

    (Date.today.year - @item.publish_date.year) >= 10 && @on_spotify == true
  end
end
