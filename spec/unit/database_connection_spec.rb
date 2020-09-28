require "./lib/database_connection"

describe DatabaseConnection do
  describe "#.setup" do
    it "connects to a specific database" do
      expect(PG).to recieve(:connect).with(dbname: "makersbnb_test")
      DatabaseConnection.setup("makersbnb_test")
    end
  end

  describe "#.connection" do
    it "checks the connection to the database" do
      connection = DatabaseConnection.setup("makersbnb_test")
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe "#.query" do
    it "completes a query" do
      connection = DatabaseConnection.setup("makersbnb_test")

      expect(connection).to recieve(:exec).with("SELECT * FROM users;")
      DatabaseConnection.query("SELECT * FROM users;")
    end
  end
end
