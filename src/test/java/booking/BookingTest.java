package booking;

import com.intuit.karate.junit5.Karate;

class BookingTest {

    @Karate.Test
    Karate testBooking() {
        return Karate.run("booking").relativeTo(getClass());
    }

}
