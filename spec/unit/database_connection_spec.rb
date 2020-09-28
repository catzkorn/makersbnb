require "./lib/database_connection"

describe DatabaseConnection do
  describe "#.setup" do
    it "connects to a specific database" do
      expect(PG).to receive(:connect).with(dbname: "makersbnb_test")
      DatabaseConnection.setup("makersbnb_test")
    end
  end

  describe "#.query" do
    it "completes a query" do
      connection = DatabaseConnection.setup("makersbnb_test")
      expect(connection).to receive(:exec).with("SELECT * FROM users;")
      DatabaseConnection.query("SELECT * FROM users;")
    end
  end
end
