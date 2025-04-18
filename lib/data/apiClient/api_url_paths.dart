const String BASE_URL = 'your base url';

// Auth
const String REGISTER_USER_URL = BASE_URL + 'api/auth/register';
const String LOGIN_USER_URL = BASE_URL + 'api/auth/login';
const String LOGOUT_USER_URL = BASE_URL + 'api/auth/logout';
const String PASSWORD_RESET_USER_URL = BASE_URL + 'api/auth/password-reset';
const String USER_PROFILE_URL = BASE_URL + 'api/auth/profile';
const String UPDATE_USER_PROFILE_URL = BASE_URL + 'api/auth/profile/update';

// Sports
const String AVAILABLE_SPORTS_URL = BASE_URL + 'api/sports';
const String SPORTS_DETAILS_URL = BASE_URL + 'api/sports/{id}';
const String SPORTS_FILTER_URL = BASE_URL + 'api/sports/filter';

// Bookings
const String CHECK_VENUE_AVAILABILITY_URL =
    BASE_URL + 'api/bookings/check-availability';
const String CREATE_BOOKING_URL = BASE_URL + 'api/bookings/create';
const String GET_USER_BOOKING_URL = BASE_URL + 'api/bookings';
const String GET_ALL_BOOKING_URL = BASE_URL + 'api/bookings/admin';
const String APPROVE_BOOKING_URL = BASE_URL + 'api/bookings/{id}/approve';
const String REJECT_BOOKING_URL = BASE_URL + 'api/bookings/{id}/reject';
const String CANCEL_BOOKING_URL = BASE_URL + 'api/bookings/{id}/cancel';
const String REFUND_BOOKING_URL = BASE_URL + 'api/bookings/{id}/refund';

// Payments
const String PAYMENT_INITIATE_URL = BASE_URL + 'api/payments/initiate';
const String GET_PAYMENT_STATUS_URL = BASE_URL + 'api/payments/{id}';
const String GET_TRANSACTION_HISTORY_URL = BASE_URL + 'api/payments/history';
const String REQUEST_REFUND_URL = BASE_URL + 'api/payments/refund';
const String GET_INVOICE_DETAIL_URL = BASE_URL + 'api/payments/invoice/{id}';

// Reviews
const String REVIEW_RATING_URL = BASE_URL + 'api/reviews';
const String GET_REVIEW_BY_ID_URL = BASE_URL + 'api/reviews/{venue_id}';
const String DELETE_REVIEW_URL = BASE_URL + 'api/reviews/{id}';

// Notifications
const String SEND_NOTIFICATION_URL = BASE_URL + 'api/notifications/send';
const String PAYMENT_NOTIFICATION_URL = BASE_URL + 'api/notifications/payment';
const String GET_ALL_NOTIFICATIONS_URL = BASE_URL + 'api/notifications';

// Membership & Trainer Booking
const String GET_SUBSCRIPTION_PLANS_URL = BASE_URL + 'api/membership/plans';
const String SUBSCRIBE_PLAN_URL = BASE_URL + 'api/membership/subscribe';
const String GET_ACTIVE_SUBSCRIPTION_URL =
    BASE_URL + 'api/membership/subscription';
const String CANCEL_SUBSCRIPTION_URL = BASE_URL + 'api/membership/cancel';
const String GET_AVAILABLE_TRAINERS_URL = BASE_URL + 'api/membership/trainers';
const String BOOK_TRAINER_SESSION_URL = BASE_URL + 'api/membership/booking';
const String GET_TRAINER_BOOKINGS_URL = BASE_URL + 'api/membership/bookings';
const String CONFIRM_TRAINER_BOOKING_URL =
    BASE_URL + 'api/membership/booking/{id}/confirm';

// Reports & Analytics (Admin)
const String GET_REVENUE_REPORTS_URL = BASE_URL + 'api/reports/revenue';
const String GET_USER_TRENDS_URL = BASE_URL + 'api/reports/user-trends';
const String GET_TOP_VENUES_URL = BASE_URL + 'api/reports/top-venues';

// Chat & Social
const String CREATE_CHAT_GROUP_URL = BASE_URL + 'api/chat/group/create';
const String GET_CHAT_GROUP_MESSAGES_URL = BASE_URL + 'api/chat/group/{id}';
const String SHARE_APP_LINK_URL = BASE_URL + 'api/share/app';
