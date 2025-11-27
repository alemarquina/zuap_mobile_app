# Zuap App

**Zuap** es una aplicación móvil diseñada para motociclistas de vehículos eléctricos. [cite_start]Su objetivo principal es gestionar el intercambio de baterías (*battery swapping*), permitiendo a los usuarios localizar estaciones cercanas, reservar baterías cargadas y realizar pagos de manera eficiente[cite: 9].

## Tecnologías

*   ![Flutter](https://img.shields.io/badge/Flutter-25A6D5?style=for-the-badge&logo=Flutter&logoColor=white)
*   ![Odoo](https://img.shields.io/badge/Odoo-714B67?style=for-the-badge)
*   ![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)

## Integraciones

El ecosistema de Zuap utiliza una arquitectura distribuida que integra la aplicación móvil con dos proveedores de Backend distintos:

* [cite_start]**Mapas:** Google Maps / Waze[cite: 19].
* [cite_start]**Notificaciones:** Firebase Cloud Messaging (FCM)[cite: 20].
* [cite_start]**Backend Técnico (Hardware):** Proveedor Chino (Encargado de autenticación, telemetría y control de baterías)[cite: 146, 162].
* [cite_start]**Protocolos de Comunicación:** REST JSON API y WebSocket (para actualizaciones en vivo)[cite: 11, 22].
* [cite_start]**Pasarela de Pagos:** Izipay (Soporte para Yape, Plin y Tarjetas)[cite: 18].

## ⭐ Características Principales

* [cite_start]**Intercambio de Baterías:** Flujo completo para solicitar y confirmar el cambio de una batería agotada por una cargada[cite: 66, 68].
* [cite_start]**Geolocalización de Estaciones:** Mapa interactivo para ver disponibilidad de baterías y navegación hacia las estaciones[cite: 47, 50].
* [cite_start]**Telemetría en Tiempo Real:** Visualización del estado de carga, salud de la batería y temperatura[cite: 170, 171].
* [cite_start]**Gestión de Pagos y Planes:** Compra de planes de suscripción y recargas de saldo (Wallet) integrados con Odoo[cite: 95, 97].
* [cite_start]**Estadísticas de Ahorro:** Cálculo del ahorro monetario y reducción de CO2 comparado con motos de combustión[cite: 113, 115].

## Arquitectura del Proyecto

La arquitectura del proyecto sigue los principios de Clean Architecture, organizada modularmente por "features". Cada carpeta en lib/features/ representa un dominio de negocio específico de Zuap:

lib/
├── main.dart                   
├── core/                       
│   ├── config/                
│   ├── errors/                
│   ├── network/                
│   ├── storage/                
│   └── utils/                 
│
├── features/                   
│   │
│   ├── auth/                   
│   │   ├── data/               
│   │   ├── domain/             
│   │   └── presentation/       
│   │
│   ├── stations/               
│   │   ├── data/               
│   │   ├── domain/             
│   │   └── presentation/       
│   │
│   ├── swap/                   
│   │   ├── data/               
│   │   ├── domain/             
│   │   └── presentation/       
│   │
│   ├── telemetry/              
│   │   ├── data/               
│   │   ├── domain/             
│   │   └── presentation/       
│   │
│   ├── wallet/                 
│   │   ├── data/               
│   │   ├── domain/             
│   │   └── presentation/       
│   │
│   ├── vehicles/              
│   │   ├── data/               
│   │   ├── domain/             
│   │   └── presentation/       
│   │
│   └── profile/                
│       ├── data/              
│       ├── domain/             
│       └── presentation/       
│
└── shared/                     
    ├── widgets/                
    └── theme/                 

**Software Company**: Digilab