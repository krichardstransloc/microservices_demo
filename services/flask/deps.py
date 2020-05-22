import dateutil
import pytz

dateutil_msg = (
    f'Service is running dateutil {dateutil.__version__}. '
    f'Base installs 2.8.0, service installs 2.8.1.'
)
print(dateutil_msg)

pytz_msg = (
    f'Service is running pytz {pytz.__version__}. '
    f'Base installs 2020.1, service installs 2019.3'
)
print(pytz_msg)
