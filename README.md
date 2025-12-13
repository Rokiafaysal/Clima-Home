<div align="center">

<img src="assets//images//logo4.png" alt="KemetPass Logo" width="300" height="300">



[![Typing SVG](https://readme-typing-svg.demolab.com?font=inter&pause=1000&color=b5bafa&center=true&width=600&lines=Clima+Home+-++Smart+Home+App;A+smart+way+to+Control+Your+Home)](https://git.io/typing-svg)

[![Dart](https://img.shields.io/badge/Dart-3.10.0-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Flutter](https://img.shields.io/badge/Flutter-3.38.2-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Python](https://img.shields.io/badge/Python-3.12+-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://python.org)

</div>




## 📌 Project Summary
A cross-platform Flutter app to control home actuators  **Fan, Light, Curtain, and Garage** - in **Auto** or **Manual** mode.  
- **Auto mode:** decisions come from a weather-forecasting model (remote ML service or local lightweight model).  
- **Manual mode:** user directly overrides each actuator in the app.  
- App integrates with a weather data provider for real-time & forecast inputs and exposes a simple API for the ML predictor.


## ✨ Key Features
- Two operation modes: **Auto** (prediction-driven) and **Manual** (user control).  
- Support for Fan, Light, Curtain, Garage with explicit on/off or multi-state control.  
- Weather-aware automation (temperature, precipitation, wind, etc.).  
- Option to run ML forecasting server (Python) or use a lightweight embedded model.  
- Logs & local state persistence (SharedPreferences / local DB).  
- Secure API key configuration for weather provider.

---


- **Weather API:** provides current + forecast weather (e.g., OpenWeatherMap One Call API).  
- **ML Forecast Service:** a lightweight time-series model (TensorFlow / Prophet / scikit-learn) that outputs actionable recommendations (e.g., open/close curtain, enable fan).  
- **Flutter App:** displays UI, allows switching Auto/Manual, shows recommendations, and sends commands to devices (via HTTP, MQTT, or Bluetooth).


## 🔬 How Auto vs Manual Works

### Manual
- User toggles devices directly from the UI.
- App sends direct commands to hardware controller (HTTP).

### Auto
1. App queries the **Weather API** for current & forecast conditions. 
2. App sends latest weather + local sensor data to the **ML Forecast Service** (or the service pulls weather).  
3. ML service returns recommendations (e.g., `fan: on`, `curtain: close`, `garage: keep_closed`).  
4. App displays recommendation and **applies it automatically** (if user allowed auto-actuation) or asks user confirmation per setting.


## ⚙️ Data Sources & Libraries (recommended)
- **OpenWeatherMap**: (Current, Forecast, One Call API 3.0) reliable global weather API.  
- **NOAA / NCEI (Climate Data Online)**: historical climate datasets if you need long-term historical data.  
- **TensorFlow**: for neural-network time-series forecasting (LSTM, CNN) 
- **Prophet** (Meta):  quick, robust time-series forecasting for seasonality and trend modelling. 
- **scikit-learn**: classic ML models and preprocessing utilities. 


## 🧩 Requirements

### App
- Flutter SDK 
- `provider` 
- `http` (REST calls)  
- `mqtt_client` or `flutter_blue` (for device comms, optional)  
- `shared_preferences` or `hive` for persistence

### ML Server (optional)
- Python 3.13+  
- `tensorflow` / `scikit-learn`  
- `fastapi` to expose a prediction REST endpoint  
- Hosting: `HugguingFace`

