#include <string>
#include <vector>
using namespace std;

enum class OrderBookType { bid, ask, uknown };

class OrderBookEntry {
private:
public:
  OrderBookEntry(string _timestamp, string _product, OrderBookType _type,
                 double _price, double _amount);

  string timestamp;
  string product;
  OrderBookType type;
  double amount;
  double price;
};

class OrderBookMapper {
    private: 
    public:
        static OrderBookType map_string(string *value);
};

class OrderBookProcessor {
public:
  double computeAveragePrice(vector<OrderBookEntry> &entries) const;
  double computeLowPrice(vector<OrderBookEntry> &entries) const;
  double computeHighPrice(vector<OrderBookEntry> &entries) const;
  double computePriceSpread(vector<OrderBookEntry> &entries) const;
};

