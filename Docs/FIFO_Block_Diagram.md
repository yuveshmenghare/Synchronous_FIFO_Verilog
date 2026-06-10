          +------------------+
          |     Producer     |
          +------------------+
                    |
                    v

          +------------------+
          |       FIFO       |
          |                  |
          | Memory Array     |
          | Write Pointer    |
          | Read Pointer     |
          | Counter          |
          | Full/Empty Flag  |
          +------------------+
                    |
                    v

          +------------------+
          |     Consumer     |
          +------------------+
