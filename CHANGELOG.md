# Week 3 Changelog

## API Integration
- Program Listing Screen: Now fetches data from ApiService.getPrograms()
- Program Details Screen: Uses the same API data source
- Data Source: Mock API service with simulated network delays

## Forms Added
- Feedback Form with fields: Name, Email, Star Rating, Message
- Validation: Email format, required fields, minimum character lengths
- Submission: Integrates with ApiService.submitFeedback()

## User Experience Improvements
- Loading indicators during API calls
- Error handling with SnackBar notifications
- Form validation with real-time user feedback