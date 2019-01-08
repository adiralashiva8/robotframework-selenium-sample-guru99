> Sample automation project using page object model and RobotFramework

> Included robotframework-metrics project for custom report

### Execute By Suite:
```
robot --pythonpath robo_guru99/ tests/login.robot tests/manager_dashboard.robot
```
### Execute By Test Name:
```
robot --pythonpath robo_guru99/ --test "Validate Available Links In Manager Dashboard"
```
or
```
robot --pythonpath robo_guru99/ -t "Validate Available Links In Manager Dashboard"
```
### Execute By Tag Name
```
robot --pythonpath robo_guru99/ --include smoke-test
```
or

```
robot --pythonpath robo_guru99/ -i smoke-test
```
