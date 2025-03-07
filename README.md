# SatelliteNetworkSim

A simulation tool designed to model, analyze, and optimize satellite networks. This repository provides algorithms and tools for simulating satellite constellations, inter-satellite communications, and ground station interactions. Ideal for researchers, engineers, and enthusiasts in the fields of aerospace, telecommunications, and network design.

## Context  
This project addresses the challenge of designing a satellite network to provide connectivity to the most disconnected regions of Colombia, such as La Guajira, Amazonas, and others. The goal is to explore how satellite networks can bridge the digital divide in these underserved areas.  

## Approach  
We consider terrestrial satellite networks focusing on GEO (Geostationary Earth Orbit) and LEO (Low Earth Orbit) constellations. For simplicity, this simulation does not account for Earth's rotation but provides a baseline model for network design and performance analysis.  

## Simulation  
The initial simulation was conducted using Universe Sandbox, establishing the first parameters for building the satellite network model. These include:  
- Defining orbital parameters for GEO and LEO satellites.  
- Positioning satellites to maximize coverage over target regions.  
- Simulating basic communication links and analyzing potential coverage gaps.



Here is the simulation of the satellite network without Earth's rotation:  

<p align="center">
  <img src="https://github.com/user-attachments/assets/5c34dae2-198e-45e2-b719-1cfa3a2d653e" alt="Satellite Network Simulation" width="600">
</p>



## Simulation with Earth's Rotation  

The following image represents the simulation considering Earth's rotation within the solar system:  

<p align="center">
  <img src="https://github.com/user-attachments/assets/e5224030-ef7c-44a0-8100-928edd5b6bba" alt="Simulation with Earth's Rotation" width="600">
</p>


## Accessing the Simulation Videos  

If you'd like to view the videos of the simulations, you can download them directly from the repository. The video files are located in the following path:  

`UniverseSandboxSimulationVideos/`  

Make sure to download the files to your local device to play them.  


## MATLAB Scripts  

To perform advanced simulations of satellite networks, the **Satellite Communications Toolbox** in MATLAB was used. Below is a description of the key script and its functionality:  

### Script: `Satellite_Connection_Simulation_Chart.m`  
This script represents the connection that should exist globally between:  
- A **base station** located in Bogotá, Colombia.  
- A **satellite** in a LEO orbit at an altitude between 500 km and 2000 km.  
- A **downlink location**, in this case, Uribia, a region in Colombia with a high need for connectivity.  

The simulation aims to illustrate the communication links between these three key points and analyze the potential for establishing a reliable connection.  

### Output Visualization  
The following image illustrates what the MATLAB script `Satellite_Connection_Simulation_Chart.m` should generate:  

<p align="center">
  <img src="https://github.com/user-attachments/assets/1387af3f-a5ce-454a-8342-5c14b7e03192" alt="MATLAB Simulation Output" width="600">
</p>



### Script: `ModulationofPackets.m`  
In this script, we simulate the process of packet transmission from different base stations to the satellite. The script demonstrates how the satellite receives and processes these packets, with a live simulator that allows you to choose the number of packets to send and the desired latency percentage.  

It is important to note that if the latency is high, the packets will be fragmented before transmission. This feature simulates the real-world challenges of communication in satellite networks, where high latency can affect packet integrity and transmission efficiency.  

### Output Visualization  
The following image illustrates what the script `ModulationofPackets.m` would show:  

<p align="center">
  <img src="https://github.com/user-attachments/assets/3871c25c-fe6c-4324-94d3-617063668b0a" alt="Packet Modulation Simulation" width="600">
</p>


### Script: `Non_Step_Satellite_Network.m`  
In this script, we simulate a satellite network within the solar system, where a non-stepped network is implemented. In this setup, there are no time offsets between satellites in the LEO orbit. Additionally, a GEO orbit is constructed to ensure that one satellite is always present, though it comes with high latency of up to 600 ms. This setup poses a risk for potential failures in the LEO constellation, as a single failure could impact the entire network.  

### Output Visualization  
The following image represents the simulation setup described above:  

<p align="center">
  <img src="https://github.com/user-attachments/assets/4fb2d376-b98c-4b3b-8bfe-e76e2bab5fcc" alt="Non-Stepped Satellite Network Simulation" width="600">
</p>


### Script: `FullSatelliteSimulation.m`  
This script represents the complete satellite simulation, where the time offset between satellites is considered. The goal is to ensure that at least one satellite is always present in the LEO constellation over Colombia.  

In the script, you can modify the number of orbits and the number of satellites per orbit to customize the simulation. This flexibility allows you to test different configurations and observe how they affect satellite coverage and connectivity.  

### Station Simulation in Colombia  
The following image shows the stations built in Colombia, simulating the regions covered by the satellite network:  

<p align="center">
  <img src="https://github.com/user-attachments/assets/324b96ef-8047-4930-9cb3-2d715bd12768" alt="Colombia Stations Simulation" width="600">
</p>

### Real-Time Satellite Movement Simulation  
Additionally, the script allows you to interact with the real-time satellite movement simulator. You can adjust parameters and watch the satellites' movements in real time to better understand their trajectory and coverage.  

The following image represents the full view of the real-time simulator:  

<p align="center">
  <img src="https://github.com/user-attachments/assets/a6b43d40-79ac-4538-a948-f34ade1db488" alt="Full Satellite Simulator View" width="600">
</p>


## Cisco Packet Tracer Simulation  

Now we move to the simulation performed in **Cisco Packet Tracer**, where a satellite network is simulated in a more simplified manner. As there are no satellites in the Cisco configuration, we simulated the satellite's functionality using a **tablet device**. In this simulation, the satellite's role is represented by the tablet, which connects through a **Base Station** with an **Access Point** for data upload. Following that, a **download link antenna** (using 3G/4G technology) facilitates the download process.  

The configuration ensures that a connection is established in the **Guajira region**, an example territory where this simulation was set up. The network provides connectivity to areas such as **Albania**, **Barrancas**, and **Uribia**, allowing users in these locations to have access to reliable internet. Although the simulation is based on the Guajira region, it can be replicated in any territory with similar infrastructure.  

### Cisco Packet Tracer Script: `SimulacionCisco.pkt`  
The simulation file for this setup is named `SimulacionCisco.pkt`.  

### Cisco Packet Tracer Simulation Image  
The following image shows the setup and simulation performed in Cisco Packet Tracer:  

<p align="center">
  <img src="https://github.com/user-attachments/assets/3ae0e366-4806-4761-a38d-ffb080b816fa" alt="Cisco Packet Tracer Simulation" width="600">
</p>

## Final Remarks

This project demonstrates the simulation of satellite networks, using both MATLAB and Cisco Packet Tracer for creating various network configurations and understanding the communication flow between satellites and ground stations. Through different simulations, we explored scenarios with varying latencies, network configurations, and real-time movement of satellites, with a particular focus on providing connectivity to remote regions of Colombia, like the Guajira.

## Recommendations

- **Scalability:** When testing larger networks, consider adjusting the number of satellites and orbits. This will help you analyze how the network behaves as more satellites are added.
- **Latency Impact:** Be mindful of the latency in satellite communications, especially in high-latency configurations. This can affect the performance of the network, especially in real-time applications.
- **Geographic Adaptability:** While this simulation focused on the Guajira region, similar configurations can be applied to any remote or under-connected region around the world.
- **Testing Real-World Scenarios:** You can modify the number of satellite links, add redundancy in the network, or change parameters like packet loss or fragmentation based on the simulation results to reflect real-world conditions more accurately.

## Author

This project was developed by **xrl3y**.

<img src="https://user-images.githubusercontent.com/73097560/115834477-dbab4500-a447-11eb-908a-139a6edaec5c.gif">


