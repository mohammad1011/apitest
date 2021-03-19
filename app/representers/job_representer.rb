class JobRepresenter
    def initialize(job)
      @job = job
    end

    def as_json
      {
        id: job.id,
        title: job.title,
        email: job.user.email

      }
    end
    
    private
    attr_reader :job
end
