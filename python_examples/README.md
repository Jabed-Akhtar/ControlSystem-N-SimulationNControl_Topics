# Examples

## Input signals
>> **Time vector**  
>> t = np.linspace(0, 10, 1000)  # Adjust the time span as needed  
1. Step Input (Unit Step)  
step_input = np.ones_like(t)  
2. Ramp Input  
ramp_input = t  
3. Sinusoidal Input  
frequency = 1.0  # Adjust the frequency as needed  
amplitude = 1.0  # Adjust the amplitude as needed  
sinusoidal_input = amplitude * np.sin(2 * np.pi * frequency * t)  
4. Impulse Input  
impulse_input = np.zeros_like(t)  
impulse_input[0] = 1.0  # Impulse at t = 0  
5. Square Wave Input  
square_wave_input = np.where(np.sin(2 * np.pi * frequency * t) >= 0, 1.0, 0.0)  
6. Random Noise (Gaussian White Noise)  
mean = 0.0  
std_deviation = 0.1  # Adjust the standard deviation as needed  
random_noise = np.random.normal(mean, std_deviation, len(t))  
7. Custom Inputs  
8. Disturbance Inputs  
9.  Combined Inputs  

## Controllers
1. P-Controller and Tt-Process
2. I-Controller and Tt-Process (Ks and Tt)
3. PI-Controller and Tt-Process

## LTI system representation
1. State space systems
2. Transfer functions
3. FRD (frequency response data) systems
4. Discrete time systems

## Arithmetic Operations
### Commonly used:
1. feedback()
2. parallel()
3. series()

### Others can be found at: https://python-control.readthedocs.io/en/0.8.4/control.html#function-ref
