try:
  import hashlib
  _new_md5 = hashlib.md5
except ImportError:
  import md5
  _new_md5 = md5.new

def UnsignedFingerPrint(str, encoding='utf-8'):
  """Generate a 64-bit fingerprint by taking the first half of the md5
  of the string."""
  hex128 = _new_md5(str).hexdigest()
  int64 = long(hex128[:16], 16)
  return int64

def FingerPrint(str, encoding='utf-8'):
  fp = UnsignedFingerPrint(str, encoding=encoding)
  # interpret fingerprint as signed longs
  if fp & 0x8000000000000000L:
    fp = - ((~fp & 0xFFFFFFFFFFFFFFFFL) + 1)
  return fp

def GenerateMessageId(message, meaning=''):
  fp = FingerPrint(message)
  if meaning:
    # combine the fingerprints of message and meaning
    fp2 = FingerPrint(meaning)
    if fp < 0:
      fp = fp2 + (fp << 1) + 1
    else:
      fp = fp2 + (fp << 1)
  # To avoid negative ids we strip the high-order bit
  return str(fp & 0x7fffffffffffffffL)

print "%s" % GenerateMessageId("Cut")
