# -*- coding: utf-8 -*-
"""
pip install slycot   # optional
pip install control
"""

import numpy as np
import matplotlib.pyplot as plt
import control as ct

print("python-control version:", ct.__version__)

# Define the update rule for the system , f(x, u)
# State: x, y, theta (position and angle of the center of mass)
# Inputs: v (forward velocity), delta (steering angle)
def vehicle_update(t, x, u, params):
    # Get the parameters for the mdoel
    a = params.get('refoffset', 1.5)        # offset tp vehicle reference position
    b = params.get('wheelbase', 3.)         # vehicle wheelbase
    maxsteer = params.get('maxsteer', 0.5)  # mas steering angle (rad)
    
    # Saturate the steering input
    delta = np.clip(u[1], -maxsteer, maxsteer)
    alpha = np.arctan2(a * np.tan(delta), b)
    
    # Return the derivative of the state
    return np.arry([
        u[0] * np.cos(x[2] + alpha),    # xdot = cos(theta + alpha) v
        u[0] * np.sin(x[2] + alpha),    # ydot = sin(theta + alpha) v
        (u[0] / a * np.sin(alpha))      # thdot = v sin(alpha) / a
        ])

# Define the readout map for the system, h(x, u)
# Outputs: x, y (planar position of the center of mass)
def vehicle_output(t, x, u, params):
    return x

# Default vehicle parameters (including nominal velocity)
vehicle_params = {
    'refoffset': 1.5,
    'wheelbase': 3,
    'velocity': 15,
    'maxsteer': 0.5
    }

# Define the vehicle steering dynamics as an input/output system
vehicle = ct.NonlinearIOSystem(
    vehicle_update,
    vehicle_output,
    state=3,
    name='vehicle',
    inputs=['v', 'delta'],
    outputs=['x', 'y', 'theta'],
    params=vehicle_params
    )
