# source file to test illegal mips32r2 instructions

        .set noreorder
      .set noat

      .text
text_label:

      # insert and extract position/size checks:

	# ext constraint: 0 <= pos < 32
	ext	$4, $5, -1, 1		# error
	ext	$4, $5, 0, 1
	ext	$4, $5, 31, 1
	ext	$4, $5, 32, 1		# error

	# ext constraint: 0 < size <= 32
	ext	$4, $5, 0, 0		# error
	ext	$4, $5, 0, 1
	ext	$4, $5, 0, 32
	ext	$4, $5, 0, 33		# error

	# ext constraint: 0 < (pos+size) <= 32
	ext	$4, $5, 0, 0		# error
	ext	$4, $5, 0, 1
	ext	$4, $5, 31, 1
	ext	$4, $5, 31, 2		# error

	# ins constraint: 0 <= pos < 32
	ins	$4, $5, -1, 1		# error
	ins	$4, $5, 0, 1
	ins	$4, $5, 31, 1
	ins	$4, $5, 32, 1		# error

	# ins constraint: 0 < size <= 32
	ins	$4, $5, 0, 0		# error
	ins	$4, $5, 0, 1
	ins	$4, $5, 0, 32
	ins	$4, $5, 0, 33		# error

	# ins constraint: 0 < (pos+size) <= 32
	ins	$4, $5, 0, 0		# error
	ins	$4, $5, 0, 1
	ins	$4, $5, 31, 1
	ins	$4, $5, 31, 2		# error

# Force at least 8 (non-delay-slot) zero bytes, to make 'objdump' print ...
	.space  8
