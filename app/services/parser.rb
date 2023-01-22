class Parser
  attr_reader :data_arr

  DEFAULT_DIR = 'data/poker_tournaments.csv'.freeze

  def initialize(file_dir = DEFAULT_DIR)
    @data_arr = CSV.open(file_dir).to_a
  end

  def perform
    event_id = nil
    data_arr.each_with_index do |row, i|
      next if row[0].nil?

      event_id = create_an_event(row[0], data_arr[i+1][2..-1]) if new_event?(row[0])

      if event_id && !row[0].to_i.zero?
        player_id = create_player(row[1])
        create_entrant(row[0..3], event_id, player_id) if player_id
      end
    end
  end

  private

  def new_event?(data)
    data != 'Place' && data.to_i.zero?
  end

  def create_an_event(name, data)
    data = {
      name: name,
      points_qual: data[0].to_f,
      prize_pool: data[1][1..-1].delete(',').to_f,
      buy_in: data[2][1..-1].delete(',').to_f,
      entrants_count: data[3].to_i,
      holding_date: Date.strptime(data[4], '%m/%d/%y'),
    }
    (Event.find_by(name: name) || Event.create(data)).id
  end

  def create_player(full_name)
    (Player.find_by(full_name: full_name) || Player.create(full_name: full_name)).id
  end

  def create_entrant(data, event_id, player_id)
    data = {
      place: data[0].to_i,
      points_qual: data[2].to_f,
      prize_pool: data[3][1..-1].delete(',').to_f,
      event_id: event_id,
      player_id: player_id,
    }
    Entrant.create(data)
  end
end
