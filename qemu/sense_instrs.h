#ifndef __SENSE_INSTRS_H__
#define __SENSE_INSTRS_H__


/* Sensitive instructions types of classes.  */
enum sense_instr_type
{
  sic_status_register_access,
  /* A helper to know the number of elements.  */
  sic_end
};


#define SENSE_INSTR(si_class, value, mask, name) sic_ ## si_class,
const enum sense_instr_type sense_instr_class[] = {
#include "sense_instrs.def"
sic_end
};
#undef SENSE_INSTR


#define SENSE_INSTR(si_class, value, mask, name) value,
const unsigned long sense_instr_value[] = {
#include "sense_instrs.def"
};
#undef SENSE_INSTR


#define SENSE_INSTR(si_class, value, mask, name) mask,
const unsigned long sense_instr_mask[] = {
#include "sense_instrs.def"
};
#undef SENSE_INSTR


#define SENSE_INSTR(si_class, value, mask, name) name,
const char *sense_instr_name[] = {
#include "sense_instrs.def"
};
#undef SENSE_INSTR


#define SENSE_INSTR_CLASS(rec)	    sense_instr_class[rec]
#define SENSE_INSTR_VALUE(rec)	    sense_instr_value[rec]
#define SENSE_INSTR_MASK(rec)	    sense_instr_mask[rec]
#define SENSE_INSTR_NAME (rec)	    sense_instr_name[rec]
#define is_end(rec)		   (sense_instr_class[rec] == sic_end)
#define sensitive_instr_size	   (sizeof (sense_instr_class) / sizeof (enum sense_instr_type))


unsigned find_in_sensitive (unsigned long);
static inline bool is_sensitive (unsigned long);

extern unsigned find_in_sensitive (unsigned long given)
{
  unsigned find;
  for (find = 0; !is_end (find); find++)
    {
      if ((given & SENSE_INSTR_MASK (find)) == SENSE_INSTR_VALUE (find))
	return find;
    }
  return find;
}


static inline bool is_sensitive (unsigned long given)
{
  return find_in_sensitive (given) != sensitive_instr_size;
}



#endif /* __SENSE_INSTRS_H__ */
