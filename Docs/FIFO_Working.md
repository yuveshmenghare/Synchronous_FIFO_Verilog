# FIFO Working

1. Data enters FIFO through buf_in.
2. Write pointer indicates next write location.
3. Data is stored in memory.
4. FIFO counter increments.
5. Read pointer indicates next read location.
6. Data is fetched from memory.
7. FIFO counter decrements.
8. Full and Empty flags prevent overflow and underflow.
9. Circular buffer allows memory reuse.
