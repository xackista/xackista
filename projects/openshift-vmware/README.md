# 🔴 OpenShift UPI on VMware

Reference architecture covering RHCOS, Ignition, VMware, DNS/NTP, HAProxy, API/Ingress load balancing and certificate/SAN planning.

```text
DNS/NTP -> HAProxy VIP -> Master1/2/3
                         |
                      Workers
                         |
                    VMware vSphere
```

Troubleshooting order:

**DNS → network/VIP → HAProxy → Ignition → certificates/SAN → machine configuration → cluster operators**
