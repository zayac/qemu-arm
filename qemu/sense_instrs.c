#include "sense_instrs.h"

unsigned find_in_sensitive (long given)
{
  unsigned find;
  for (find = 0; !is_end (find); find++)
    {
      if ((given & SENSE_INSTR_MASK (find)) == SENSE_INSTR_VALUE (find))
	return find;
    }
  return find;
}

int is_sensitive (long given)
{
  return find_in_sensitive (given) != sensitive_instr_size;
}


