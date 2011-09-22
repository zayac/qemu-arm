#ifndef __SENSE_INSTRS_H__
#define __SENSE_INSTRS_H__


/* Sensitive instructions types of classes.  */
#define SENSE_TYPE(si_class, str) sic_ ## si_class,
enum sense_instr_type
{
#include "sense_types.def"  
  /* A helper to know the number of elements.  */
  sic_end
};
#undef SENSE_TYPE

#define SENSE_TYPE(si_class, str) str,
const char *sense_type_name[] = {
#include "sense_types.def"
};
#undef SENSE_TYPE

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


#define SENSE_INSTR_CLASS(rec)	    sense_instr_class[(rec)]
#define SENSE_INSTR_VALUE(rec)	    sense_instr_value[(rec)]
#define SENSE_INSTR_MASK(rec)	    sense_instr_mask[(rec)]
#define SENSE_INSTR_NAME(rec)	    sense_instr_name[(rec)]
#define SENSE_TYPE_NAME(type)	    sense_type_name[(type)]

#define is_end(rec)		   (sense_instr_class[rec] == sic_end)
#define sensitive_instr_size	   (sizeof (sense_instr_class) / sizeof (enum sense_instr_type) - 1)


unsigned find_in_sensitive (long);
int is_sensitive (long);


#endif /* __SENSE_INSTRS_H__ */
