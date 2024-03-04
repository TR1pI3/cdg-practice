# frozen_string_literal: true

ACTRESS_LIST_PATH = 'homework_lecture_4/homework_lecture_4_task1/actresses.txt'
BUFFER = 'homework_lecture_4/homework_lecture_4_task1/buffer.txt'

def index
  File.foreach(ACTRESS_LIST_PATH) { |actress| puts actress }
end

def where(name)
  ids = []
  File.foreach(ACTRESS_LIST_PATH).with_index do |actress, index|
    ids << index if actress.include?(name)
  end
  ids
end

def update(id, name)
  file = File.open(BUFFER, 'w')
  File.foreach(ACTRESS_LIST_PATH).with_index do |actress, index|
    file.puts(id == index ? name : actress)
  end
  file.close
  File.write(ACTRESS_LIST_PATH, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end

def delete(id)
  file = File.open(BUFFER, 'w')
  File.foreach(ACTRESS_LIST_PATH).with_index do |actress, index|
    file.puts(actress) if id != index
  end
  file.close
  File.write(ACTRESS_LIST_PATH, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end

def find(id)
  File.foreach(ACTRESS_LIST_PATH).with_index do |actress, index|
    return actress.chomp if id == index
  end
end

def create(name)
  file = File.open(BUFFER, 'w')
  File.foreach(ACTRESS_LIST_PATH) do |actress|
    file.puts(actress)
  end
  file.puts(name)
  file.close
  File.write(ACTRESS_LIST_PATH, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end
