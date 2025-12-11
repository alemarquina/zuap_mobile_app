# Zuap App

**Zuap** es una aplicación móvil diseñada para motociclistas de vehículos eléctricos. Su objetivo principal es gestionar el intercambio de baterías (*battery swapping*), permitiendo a los usuarios localizar estaciones cercanas, reservar baterías cargadas y realizar pagos de manera eficiente

## Tecnologías

![Flutter](https://img.shields.io/badge/Flutter-25A6D5?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)

## Integraciones

El ecosistema de Zuap utiliza una arquitectura distribuida que integra la aplicación móvil con dos proveedores de Backend distintos:

* **Mapas:** Google Maps / Waze
* **Notificaciones:** Firebase Cloud Messaging (FCM)
* **Backend Técnico (Hardware):** Proveedor Chino (Encargado de autenticación, telemetría y control de baterías)
* **Protocolos de Comunicación:** REST JSON API y WebSocket (para actualizaciones en vivo)
* **Pasarela de Pagos:** Izipay (Soporte para Yape, Plin y Tarjetas)

## Características Principales

* **Intercambio de Baterías:** Flujo completo para solicitar y confirmar el cambio de una batería agotada por una cargada
* **Geolocalización de Estaciones:** Mapa interactivo para ver disponibilidad de baterías y navegación hacia las estaciones
* **Telemetría en Tiempo Real:** Visualización del estado de carga, salud de la batería y temperatura
* **Gestión de Pagos y Planes:** Compra de planes de suscripción y recargas de saldo (Wallet) integrados con Odoo
* **Estadísticas de Ahorro:** Cálculo del ahorro monetario y reducción de CO2 comparado con motos de combustión

## Arquitectura del Proyecto

La arquitectura del proyecto sigue los principios de Clean Architecture, organizada modularmente por "features". Cada carpeta en lib/features/ representa un dominio de negocio específico de Zuap.

```
zuap_mobile_app/
├── assets/
├── build/
├── lib/
│   ├── core/
│   │   ├── config/
│   │   ├── errors/
│   │   ├── network/
│   │   ├── routes/
│   │   ├── di/
│   │   └── utils/
│   ├── features/
│   │   ├── auth/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   ├── battery/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   ├── profile/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   ├── stations/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   ├── swap/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   ├── vehicles/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   └── wallet/
│   │       ├── data/
│   │       ├── domain/
│   │       └── presentation/
│   └── shared/
│       ├── theme/
│       └── widgets/
├── test/
├── .metadata
├── analysis_options.yaml
├── pubspec.lock
├── pubspec.yaml
└── zuap_mobiel_app.iml
```
             
**Software Company**: Digilab
**Software Developer**: Alessandro Marquina