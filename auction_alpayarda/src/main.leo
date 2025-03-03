// The 'auction_alpayarda' program.
program auction_alpayarda.aleo {
    record Bid {
        owner: address,
        bidder: address,
        amount: u64,
        is_winner: bool,
    }

    
    transition place_bid(bidder: address, amount: u64) -> Bid {
        assert_eq(self.caller, bidder);
        return Bid {
            owner: aleo1adhnvcnrh6yyy3h0phxq9rdve30uzxl55v8q9jr6g8s5k7e7lu9q79p0mm,
            bidder: bidder,
            amount: amount,
            is_winner: false,
        };
    }

    transition resolve(first: Bid, second: Bid) -> Bid {
        assert_eq(self.caller, aleo1adhnvcnrh6yyy3h0phxq9rdve30uzxl55v8q9jr6g8s5k7e7lu9q79p0mm);
        if (first.amount >= second.amount) {
            return first;
        } else {
            return second;
        }
    }

  
    transition finish(bid: Bid) -> Bid {
       
        assert_eq(self.caller, aleo1adhnvcnrh6yyy3h0phxq9rdve30uzxl55v8q9jr6g8s5k7e7lu9q79p0mm);
    
        return Bid {
            owner: bid.bidder,
            bidder: bid.bidder,
            amount: bid.amount,
            is_winner: true,
        };
    }
}