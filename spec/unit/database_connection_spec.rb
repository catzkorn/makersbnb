require "./lib/database_connection"

describe DatabaseConnection do
  describe "#.setup" do
    it "connects to a specific database" do
     expect(DatabaseConnection.setup("makersbnb_test")).to be_kind_of(PG::Connection)
    end
  end

  describe "#.query" do
    it "completes a query" do
      expect(DatabaseConnection.query("SELECT * FROM users;")).to be_kind_of(PG::Result)
    end
    it "takes two arguements" do 
      connection = DatabaseConnection.setup("makersbnb_test")
      expect(connection).to receive(:exec).with("SELECT * FROM users;", [])
      DatabaseConnection.query("SELECT * FROM users;")
    end
  end
end
