package dao;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Bus;

public class BusDAO extends DBContext {

    public BusDAO() {
        super();
    }

    public void createBus(Bus bus) {
        String query = "INSERT INTO Bus (seats, departureTime, source, destination, arrivalTime) "
                + "VALUES (?, ?, ?, ?, ?)";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, bus.getSeats());
            preparedStatement.setString(2, bus.getDepartureTime());
            preparedStatement.setString(3, bus.getSource());
            preparedStatement.setString(4, bus.getDestination());
            preparedStatement.setString(5, bus.getArrivalTime());
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<Bus> getAllHomeBuses() {
        List<Bus> buses = new ArrayList<>();
        String query = "DECLARE @currentDate DATE;\n"
                + "SET @currentDate = GETDATE(); -- Get the current date\n"
                + "\n"
                + "SELECT\n"
                + "    B.[id] AS BusId,\n"
                + "    B.[seats] AS TotalSeats,\n"
                + "    B.[departureTime],\n"
                + "    B.[source],\n"
                + "    B.[destination],\n"
                + "    B.[arrivalTime],\n"
                + "    B.[seats] - ISNULL(T.BookedSeats, 0) AS AvailableSeats\n"
                + "FROM [dbo].[Bus] B\n"
                + "LEFT JOIN (\n"
                + "    SELECT\n"
                + "        [busId],\n"
                + "        COUNT([id]) AS BookedSeats\n"
                + "    FROM [dbo].[ticket]\n"
                + "    WHERE CAST([bookedDate] AS DATE) = @currentDate\n"
                + "    GROUP BY [busId]\n"
                + ") T ON B.[id] = T.[busId];";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query);  ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int seats = resultSet.getInt("seats");
                String departureTime = resultSet.getString("departureTime");
                String source = resultSet.getString("source");
                String destination = resultSet.getString("destination");
                String arrivalTime = resultSet.getString("arrivalTime");

                Bus bus = new Bus(id, seats, departureTime, source, destination, arrivalTime);
                buses.add(bus);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return buses;
    }

    public List<Bus> getAllBuses() {
        List<Bus> buses = new ArrayList<>();
        String query = "SELECT * FROM Bus";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query);  ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int seats = resultSet.getInt("seats");
                String departureTime = resultSet.getString("departureTime");
                String source = resultSet.getString("source");
                String destination = resultSet.getString("destination");
                String arrivalTime = resultSet.getString("arrivalTime");

                Bus bus = new Bus(id, seats, departureTime, source, destination, arrivalTime);
                buses.add(bus);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return buses;
    }

    public Bus getBusById(String busId) {
        Bus bus = null;
        String query = "SELECT * FROM Bus WHERE id = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, busId);
            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    int seats = resultSet.getInt("seats");
                    String departureTime = resultSet.getString("departureTime");
                    String source = resultSet.getString("source");
                    String destination = resultSet.getString("destination");
                    String arrivalTime = resultSet.getString("arrivalTime");

                    bus = new Bus(id, seats, departureTime, source, destination, arrivalTime);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return bus;
    }

    public void updateBus(Bus bus) {
        String query = "UPDATE Bus SET seats = ?, departureTime = ?, source = ?, destination = ?, arrivalTime = ? WHERE id = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, bus.getSeats());
            preparedStatement.setString(2, bus.getDepartureTime());
            preparedStatement.setString(3, bus.getSource());
            preparedStatement.setString(4, bus.getDestination());
            preparedStatement.setString(5, bus.getArrivalTime());
            preparedStatement.setInt(6, bus.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void deleteBus(int busId) {
        String query = "DELETE FROM Bus WHERE id = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, busId);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
