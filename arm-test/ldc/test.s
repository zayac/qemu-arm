start:
  LDC p1,c2,[R5,#24]
  STC p1,c2,[R5,#24]
stop:
  b stop	      @ Infinite loop to stop execution
