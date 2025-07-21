# Imports =====================================================================
import numpy as np
import matplotlib.pyplot as plt
import control as ctrl

# P-Cotroller =================================================================
# System parameters
numerator = [1]
denominator = [1, 1]
# Create transfer function model
system = ctrl.TransferFunction(numerator, denominator)
# P-Controller parameters
Kp = 2  # Proportional parameetrs
# Create the P-Controller transfer function
controller = ctrl.TransferFunction([Kp], [1])
# Closed-loop system
closed_loop_system = ctrl.feedback(controller * system, 1)
# Time vector
time = np.linspace(0, 10, 1000)
# Step input
input_signal = np.ones_like(time)
# Simulate the closed-loop system
time, response = ctrl.step_response(sys=closed_loop_system, T=time)

# Plot the response
plt.figure()
plt.plot(time, response)
plt.xlabel("Time")
plt.ylabel("System Response")
plt.title("P Controller Response to Custom Input Signal")
plt.grid(True)
plt.show()

# __main__ ====================================================================
if __name__ == "__main__":
    pass

# ##### END OF FILE ###########################################################
