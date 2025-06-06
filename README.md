# AIM - Automated Interface Monitoring using Robot Framework

This project is built using [Robot Framework](https://robotframework.org/) for automating and monitoring a web-based interface. It leverages SeleniumLibrary for browser automation, with a structured layout for reusability, maintainability, and clear test results.

---

## 📁 Project Structure

aim-robot-tests/
│
├── resources/ # Reusable resource files with keywords, variables
│ └── login.resource # Login automation logic
│
├── tests/ # Test cases that use resources
│ └── test_login.robot
│
├── results/ # Test execution logs, reports, screenshots

Running Tests

robot -d results tests/
