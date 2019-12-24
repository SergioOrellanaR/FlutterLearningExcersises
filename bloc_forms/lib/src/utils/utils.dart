
bool isNumeric( String input)
{
  bool value = false;

  if(input.isNotEmpty && ( num.tryParse(input) != null ))
  {
    value = true;
  }

  return value;
}